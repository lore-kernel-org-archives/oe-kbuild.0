Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7429E398F8A
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Dec 2025 19:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764877592; cv=none; b=AjSbOAXpQRM6CJYXttHMu+2EK1Wm2KPcnUyT7mPAJqETywHuOQiNvyZ1Ycwo3pR1n96Rn3bmXzlapkb+6TV/XT2YBQ7/XSRBwLQWdpKqNpoQ4q5GRG0sHxCLNMPIZjWDZLdE6f6A3s6URtbjH65j7pBo4v1mo0gMEIXM//ZArKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764877592; c=relaxed/simple;
	bh=I+57bmK5awKDhc8FOBKkExzdIYxPn+WqIH9LezubMPU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nmliqVcdfnH24cfaDWaoznWebrxc73FtST75wPU2SxSHDW57BWnzNGspeOxj1I1A1DNZxBXuDW0CVKq3o7ilGZTWNMO16bS8iC2QaMRROhGzEEp/+Qm/0RZy8o7lYu5vR0UQZqqE6DVKmDJxTkS+I4lM59i25U55yS63m+iRsGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cD9L/dk2; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cD9L/dk2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764877591; x=1796413591;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=I+57bmK5awKDhc8FOBKkExzdIYxPn+WqIH9LezubMPU=;
  b=cD9L/dk2WwuSEcZKdDoHvAJCsUUL1ZDdB9xi/F3rBwN+qY7hHtMww+s/
   1MIeBWDooH+wW1q5bb5t7emF0xXcnEJfXhMhfHxwh2Sil+PXTrnlnnTUj
   P7sOsILGTyQ8ZsPrhTg+hK5LufenU/J8Dwe0kg7J7zcomTki+MMpP7jtw
   pmITrxmNw2MWZ4l52ASJpen7QwOpjLZPaRaczKlqyq+vXNckBWSC05mhv
   m7girKJo7Wr24XpmYabgjUhk9H8FNXi+6biTCro0Z5YtR/4msUefrco4a
   I16uMg+GWinb2Q6nH9fSsD1DoDany/ZxBFCXd2Rrz1fF6mUjSl6SvLsBj
   g==;
X-CSE-ConnectionGUID: DkvJviM7Q4GWti9pqRNJuw==
X-CSE-MsgGUID: G+yqObT/R3ax+k0TMPGfCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="84311516"
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; 
   d="scan'208";a="84311516"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 11:46:31 -0800
X-CSE-ConnectionGUID: G0vyHI1gRvy9LtnMtAXw+g==
X-CSE-MsgGUID: sRU9gRaERiWY+IOtTfo6ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; 
   d="scan'208";a="195875088"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 04 Dec 2025 11:46:29 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRFHW-00000000E8o-41lo;
	Thu, 04 Dec 2025 19:46:26 +0000
Date: Fri, 5 Dec 2025 03:45:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thomas-weissschuh:b4/uapi-nostdinc 3/3]
 usr/include/linux/string.h:7:10: error: 'string.h' file not found with
 <angled> include; use "quotes" instead
Message-ID: <202512050334.avQXT92k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Thomas Weiﬂschuh" <thomas.weissschuh@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/uapi-nostdinc
head:   31a040462afbf415cb6ae55dab41da03fba9aa38
commit: 31a040462afbf415cb6ae55dab41da03fba9aa38 [3/3] kbuild: uapi: validate that headers do not use libc
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: s390-randconfig-r072-20251204 (https://download.01.org/0day-ci/archive/20251205/202512050334.avQXT92k-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512050334.avQXT92k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512050334.avQXT92k-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
   In file included from ./usr/include/asm/chsc.h:14:
   In file included from usr/include/asm/chpid.h:10:
>> usr/include/linux/string.h:7:10: error: 'string.h' file not found with <angled> include; use "quotes" instead
       7 | #include <string.h>
         |          ^~~~~~~~~~
         |          "string.h"
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [m]:
   - MFD_SPACEMIT_P1 [=m] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
