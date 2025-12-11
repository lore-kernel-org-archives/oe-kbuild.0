Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C36ACA5A
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Dec 2025 23:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765497118; cv=none; b=d9/65C9hUgTeoAiJoIFmlQCdgSigzptOpMC7LidxgMC8SxYdbp56kSXOV9EpoUw0qcrTsu9jF042I4Id3gu5gMznSPATZl6KrRhbkyRrF9WTr4use3r74wRNxPVwS3J9Y8Yl7tc3w8wl+DAugsyINqpVRJXG7mJYeLnorRBrsbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765497118; c=relaxed/simple;
	bh=tNybYW8MkhJFqpwehOopxqpWqfBaKLYlA+N4wGdokQU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S53N8fMmfmALLYXC/TV4limdPALT+JOlD2zRmhvmOIiWM6RUcl41Q0U4py+Qgd214+bxymtX124WlK3NlbfkwLtQAFhuHoGjYwZuwqWMCMWQYKlOT1L+q8YLHOWGCnusS815l5P7HAQ/SZTsN2b1BKVykQ98YgcyMidB72xBWnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZTdOiHvi; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZTdOiHvi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765497116; x=1797033116;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tNybYW8MkhJFqpwehOopxqpWqfBaKLYlA+N4wGdokQU=;
  b=ZTdOiHvi82sTUdiHDOsUaKdjKpZFK4Yr77vTqjWE0Ie7fDYIC+d+JLd2
   +40X6mqf+4g5hnslBJ5AJefwzt5KThZoQbVIhQWGYYUeKCXmODVq50avt
   IT9cKkU0hoUHVkEEHOHAIb/P+BvX7d9oHhtyFyjViPefuhS6z/Tzvrp3J
   p1wY0x3mbXdITo3/sOrDB4iUaUFyMoMfWnQ5bKM0d35jmD7EAc0aey2LR
   NVjhmTJoD1nrZiWD7i/XvfrckzQelxyS61L+f0X69Ad4/gzzipHS7PQXe
   IAwo8XOl0Uk2NG5h9Ix++wxCJVePTCyVizvvsHk1LJA9J+NTwgx2XkpQR
   g==;
X-CSE-ConnectionGUID: hl9l3H7JRTWacshDdDgpPQ==
X-CSE-MsgGUID: IttlNEL2QFqRPT808S1CVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67536567"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="67536567"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 15:51:56 -0800
X-CSE-ConnectionGUID: 6bggX/94TiueSn2kURe9Iw==
X-CSE-MsgGUID: 5LVR4hHwTx6XZg79F/VJvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="196983572"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Dec 2025 15:51:55 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTqRs-000000005Cv-2Yjj;
	Thu, 11 Dec 2025 23:51:52 +0000
Date: Fri, 12 Dec 2025 07:51:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Warning: drivers/char/xilinx_hwicap/fifo_icap.c:290 function
 parameter 'num_words' not described in 'fifo_icap_get_configuration'
Message-ID: <202512120732.pEp1XIlh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: Jonathan Corbet <corbet@lwn.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: fc862949a35aa4d5e92a10c64c620cde350bd511 scripts/kernel-doc: switch to use kernel-doc.py
date:   8 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 8 months ago
config: microblaze-defconfig (https://download.01.org/0day-ci/archive/20251212/202512120732.pEp1XIlh-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512120732.pEp1XIlh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512120732.pEp1XIlh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/char/xilinx_hwicap/fifo_icap.c:207 bad line: 
   Warning: drivers/char/xilinx_hwicap/fifo_icap.c:290 function parameter 'frame_buffer' not described in 'fifo_icap_get_configuration'
>> Warning: drivers/char/xilinx_hwicap/fifo_icap.c:290 function parameter 'num_words' not described in 'fifo_icap_get_configuration'
   Warning: drivers/char/xilinx_hwicap/fifo_icap.c:290 Excess function parameter 'data' description in 'fifo_icap_get_configuration'
   Warning: drivers/char/xilinx_hwicap/fifo_icap.c:290 Excess function parameter 'size' description in 'fifo_icap_get_configuration'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
