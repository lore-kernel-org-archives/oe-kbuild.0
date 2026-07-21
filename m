Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C2A38C2D8
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Jul 2026 08:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784620913; cv=none; b=SiPsSCI0843prAH8sk0zFEbzRe0AiKh3HxKmAlmf0/lF2QzYHlILP6K7uCHVMhygtcr+l8+q1WyfDe+U8KGhfXHQcX/ltpxl+UsLWzj6QfR689QYLCAV7IGiJmNxck0dYvBnH37gU7J6nzEIzZshQ2mFDxYHDwLQW9EhMoDd+2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784620913; c=relaxed/simple;
	bh=UVSr67z9hkbqckIoPu2DaMvtnc0kXZCxQ9Dc87QJ7TM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YjcdMD20EqgD3AEcB9f1vxFEfNP7/55j+RZtr2R244DCjtKtSXqUbmO94ZO25sy5UVT9M0y2pS1Nsqon4uOQA7dRurt5Iy5R6ENDk7vTYJGUuSRwyBJ2/3fwRO4zqUzSjZeh1iFqu6rTCYclws933P3FxU7rNh2D0L/Q++BqOvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UyDMMDWa; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UyDMMDWa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784620911; x=1816156911;
  h=date:from:to:cc:subject:message-id;
  bh=UVSr67z9hkbqckIoPu2DaMvtnc0kXZCxQ9Dc87QJ7TM=;
  b=UyDMMDWalujB67rIIxDaxIhnRLd4U9/KmmmucURago7gpFWbnLkIlXNk
   kHpV+7Y3HGaaNrDpX7WSQm84Y4+fJeDZgYzihwlu6twBfYYdr5Bf2zMgZ
   m/a0Qsa7rfiwhY7mwwmUEqKAgyr75g+3d80ylICq1YFEBOzjmfpoq5DFT
   tYKy6vSPWX2AeJbAYQr0kNrvtUpaPB0tuiCfRuE9RRfYdDvxJif5HQp50
   3FI6THbJAUcRb2sj9aFfA5yBuBYevZQCxncFoSnyXpwa+ZoxzF27gW7tk
   QZtXHJZZUBgm7mxzfK3lccutpWLR6L0dMMMG4+MZgBMMWBCZf7/+XndW0
   w==;
X-CSE-ConnectionGUID: enFQsWl0TH2O53a0ATGajw==
X-CSE-MsgGUID: RHM1EUAVTBWIQQ2fgTDT8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="72747539"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; 
   d="scan'208";a="72747539"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 01:01:51 -0700
X-CSE-ConnectionGUID: xU/h+vFUR4qrp3v2YGinjQ==
X-CSE-MsgGUID: 6Ca16tA+SbeBYbI2Ur5T7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; 
   d="scan'208";a="253342380"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 21 Jul 2026 01:01:49 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wm5QB-00000000XMZ-2hDv;
	Tue, 21 Jul 2026 08:01:47 +0000
Date: Tue, 21 Jul 2026 16:01:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: WARNING: modpost: vmlinux: section mismatch in reference:
 timespec64_to_ns+0x8c (section: .text.unlikely) -> initcall_level_names
 (section: .init.data)
Message-ID: <202607211540.QfRuv4Gb-lkp@intel.com>
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
TO: Konstantin Khorenko <khorenko@virtuozzo.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Peter Oberparleiter <oberpar@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b95f03f04d475aa6719d15a636ddf32222d55657
commit: 56cb9b7d96b28a1173a510ab25354b6599ad3a33 gcov: use atomic counter updates to fix concurrent access crashes
date:   8 weeks ago
:::::: branch date: 11 hours ago
:::::: commit date: 8 weeks ago
config: xtensa-randconfig-r133-20260721 (https://download.01.org/0day-ci/archive/20260721/202607211540.QfRuv4Gb-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260721/202607211540.QfRuv4Gb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 56cb9b7d96b2 ("gcov: use atomic counter updates to fix concurrent access crashes")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607211540.QfRuv4Gb-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: put_page+0xc0 (section: .text.unlikely) -> initcall_level_names (section: .init.data)
>> WARNING: modpost: vmlinux: section mismatch in reference: timespec64_to_ns+0x8c (section: .text.unlikely) -> initcall_level_names (section: .init.data)
>> WARNING: modpost: vmlinux: section mismatch in reference: timespec64_to_ns+0x90 (section: .text.unlikely) -> set_reset_devices (section: .init.text)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
