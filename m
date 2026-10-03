Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE54130C637
	for <oe-kbuild@lists.linux.dev>; Sat,  3 Oct 2026 06:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791008935; cv=none; b=CppAXSZcQ1Bu9BwwfZ9lu8n/dotlnda2ky8xnykWdrKNcZtq52TmzXn6a7lTASy322i8eivBWwJaegoa55mhphJkTsILWBERPdtj8Lniuu5aWc21UbcZrQo2nvaqzcCj8w5Gp4nrydyDKZjm0iB6X0nUeiAMn5gda3BtPn27Rfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791008935; c=relaxed/simple;
	bh=pW/1d1pglywsuj8k4EyDcH5GmltVVmD1F+V/ntY2zQE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=slRRw+upxVu+zlXtxYTIw2bjpK9iM9U8psFMnKbyi5vrPWY2Wtz/FlrXDiJZ8aAmjp4aoM1b+4NeEZ3RSJ7YyieAvMVTOLgf71M7GA4Lq1lb5e7ob8Q5QZ00jWwuo0jJTQs9Iy3x69Z/WNNcEuZUzNhTZQeGjpyT/s0hGdhWitQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KxDbpW4+; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KxDbpW4+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791008933; x=1822544933;
  h=date:from:to:cc:subject:message-id;
  bh=pW/1d1pglywsuj8k4EyDcH5GmltVVmD1F+V/ntY2zQE=;
  b=KxDbpW4+Bu9/sqdE4RcREG9Io8vePSlwFZgdnTSY8n0Q/xO6m8BK7zu5
   +v6Ax3fqYYnfWDFh4oed9Z0Ei7VBDNsBcr2ouy0oTivqH9lirxZLsJZAR
   rbwdnV3ixa6u2NrjWj0OggIQiFQl2F3EszS+RTuKP+U8J8qh0IfBLJFEG
   FFluMIGOvi1CrH5cTV/PwbBF+AW2PyD/n8ZkdrltzrdfnUzSk/jJm7oUg
   nhU++Vt3i5MSz1lYn0EgdqLGvsvQDSX+6XMo4wzXKpmKWPRwc7t8Vt4Xy
   sZpiWYFUnWWmgBkrTKiZsgrqcikqxASQyrAS8u+Zsagaj7Pa/jj1jLD5l
   w==;
X-CSE-ConnectionGUID: /qxFg/8wSSCeV+vUjGgybg==
X-CSE-MsgGUID: EHhdOhxYRmWB7LbhVSKTUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="113547200"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="113547200"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 23:28:53 -0700
X-CSE-ConnectionGUID: Zj0Pq7xSRQ6B4Ugji5fXVw==
X-CSE-MsgGUID: O4PQrMNxRqCH9qpuC3Tr3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="275588638"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 02 Oct 2026 23:28:49 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCtEj-000000000yJ-3lYT;
	Sat, 03 Oct 2026 06:28:45 +0000
Date: Sat, 03 Oct 2026 08:28:11 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/zsmalloc.o: warning: objtool: sg_assign_page+0x1c:
 unreachable instruction
Message-ID: <202610030831.NqZokIVU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Sergey Senozhatsky <senozhatsky@chromium.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e767a4ea70a3992c37ed604157d32f0dfbf9b1e3
commit: dc2e4982cb018306f0699cd460a9033467f07be5 zsmalloc: introduce SG-list based object read API
date:   8 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 8 months ago
config: loongarch-randconfig-r2105-20261002 (https://download.01.org/0day-ci/archive/20261003/202610030831.NqZokIVU-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261003/202610030831.NqZokIVU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: dc2e4982cb01 ("zsmalloc: introduce SG-list based object read API")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610030831.NqZokIVU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/zsmalloc.o: warning: objtool: sg_assign_page+0x1c: unreachable instruction

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
