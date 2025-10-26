Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CCD23EAAD
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Oct 2025 09:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761470567; cv=none; b=Z9uK1lAvBs+4hJ6cw122qeKHKKI8AvXNGOE+E9cVVY/WJRfKU4Gfp/eHz3Cnjxd0ZOw5KY1EWUlOff6Ct5okm2pTuRSUrh3tryJ4IdyXIb/p+kTc/OH9lhzPqyaUGC/nXf3wF3ljjWJF3jbWgXI03sYPMUbPn2YHVYVxQ/3M3+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761470567; c=relaxed/simple;
	bh=47jyvTbK9pD1z4WKiBajaALYXu58mOUgbXlBzX5dNOA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BCluC5vp9GSuL4tyK4rEGGnYVEHn3pAo9uCTT1NDFrdVjrNTi8lUbUYJbYDFuKP+lhmXQBVVJJgixwFLIdtJT8nIePyeg4wq6ETGCW2y/Yb7x89WMwtY79R/02/4d9sliaMdM9XIb995+K6RCphKzyPvFovyq9t7LPVKl/SCmUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PX47MEcF; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PX47MEcF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761470566; x=1793006566;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=47jyvTbK9pD1z4WKiBajaALYXu58mOUgbXlBzX5dNOA=;
  b=PX47MEcFrTPX7ay5KTmULt/fR+RdJ7FEnu9ae1rhwvCRUFT8KluM2geI
   0cLuAnEcpXdiSFYJ8Pu3fm4QkECq1JPJWkfsl1anNalpPGqry9OeHLrUc
   Wh0f+tTtje2L1yvY5TIu6y8f5SP5xCqw42qhbTMwiuDmruZlGYJefjVFM
   otnyep9wCAdcUg+Yd/vcDyRIGZKY/RuFzD2CxG9pICJHo276H7cpqJjA+
   +JjCYNsEnH/cat168uwWF9zdPU02V2/zZPl7vqBIe0MzXoARVMfFZR+m/
   u2uL3WtUyrqr40OKFyhDOj3qOySpVLs5XqHjyKVc0NwhbrimzN9AuR6ow
   w==;
X-CSE-ConnectionGUID: IctqzQswQNuIxTTcHg5tEw==
X-CSE-MsgGUID: J13tBhciQ3Ge/sjpAzDMBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63472297"
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; 
   d="scan'208";a="63472297"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 02:22:45 -0700
X-CSE-ConnectionGUID: zyrLbbC2S0arZbpzn8PxdA==
X-CSE-MsgGUID: QhqJhVvnRXuen0uImc/Y1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; 
   d="scan'208";a="184874805"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 26 Oct 2025 02:22:45 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCwxW-000G1O-1K;
	Sun, 26 Oct 2025 09:22:42 +0000
Date: Sun, 26 Oct 2025 17:22:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mangle_uc_sigmask.c:37:10: fatal error: stdio.h: No such file or
 directory
Message-ID: <202510261747.wf9REhg6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Dev Jain <dev.jain@arm.com>
CC: Shuah Khan <skhan@linuxfoundation.org>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   72761a7e31225971d0b29d9195e0ffa986b77867
commit: cecc795329fc3e0ea2e84567ee57570cc050cf6b selftests: Add a test mangling with uc_sigmask
date:   12 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 12 months ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251026/202510261747.wf9REhg6-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251026/202510261747.wf9REhg6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510261747.wf9REhg6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mangle_uc_sigmask.c:37:10: fatal error: stdio.h: No such file or directory
      37 | #include <stdio.h>
         |          ^~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
