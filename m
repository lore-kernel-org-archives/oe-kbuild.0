Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3948C2DC796
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Sep 2025 15:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757864974; cv=none; b=TBgfUCXSTcsBKYgQaZvql/1hXhJOE0mXGcSegJMgrNHuFmY+0474BgqCYHyPHBXjBFTvfH3MfuP4Z+QFDs0CwkaZUelxudHOwftAScyZRg7sS83bfll3dFQs6CAI8QuMQbwYNZXnt+bPF6Ob+xY8kHZOe0pFUM0LNAKb4wVr0XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757864974; c=relaxed/simple;
	bh=knHtGaW9vbkDBl9qXg79Iz9huxma2eCFB+Zcg90EdgU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C/Zpk2HWRfaNGjdNK2zAA+SeTjEWZ1/vj5IfoejLyNBtubXjCBc1AR9bp51D6xnZidDeqRWbUkl3Ti0xZO+xEh5vMD7HITvM95woXqrbYImkB04u0VymqMsvGdjuDqNEbKNn+s9mOOB5gmEmk4lXGD1+9XCq82tVGuTXPvuCKHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lWJSpXyZ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lWJSpXyZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757864972; x=1789400972;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=knHtGaW9vbkDBl9qXg79Iz9huxma2eCFB+Zcg90EdgU=;
  b=lWJSpXyZ2B+gUebCQ/GcrBFxQoG8u+mJaH9QPbgGIGobkeOvgerl1eqr
   VZZf3E84nvdzLfzUyU8nZNoBp9UipXAWOqz4gTGDEU6O3y4FVhbUoPA22
   NDz1OsQ9RM1/hx0Dxs1RtbBZ9TROm46ApasMYBwEgfIo8xTxK6yGnEjwf
   uGyA1P5g0Hc6uC3djG7/1iMp4Za4srkrs1QElkcxt+G4Bt+MfaTuC88Hk
   BB0ObxVVRnI9cNxUwRbdz2xyIV37DQv62hWN/5WPgfBxy6r9BaDT003Zh
   ahFbi8aflxvgqd8+Fyjs5J8uZyxeFiimmTnsW72yOnCQGx8Uz81tBFayT
   A==;
X-CSE-ConnectionGUID: KtjquKZXSlqVHsgBNMEZ0w==
X-CSE-MsgGUID: 6W0Q4i2ZRx+UxdC/inBptw==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="60240061"
X-IronPort-AV: E=Sophos;i="6.18,264,1751266800"; 
   d="scan'208";a="60240061"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2025 08:49:32 -0700
X-CSE-ConnectionGUID: kbscgoV6QSmCI6JTj+zTgQ==
X-CSE-MsgGUID: W/3l2rf5TMe2S5RLRaoROg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,264,1751266800"; 
   d="scan'208";a="179649354"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 14 Sep 2025 08:49:31 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxoym-0002WS-1Q;
	Sun, 14 Sep 2025 15:49:28 +0000
Date: Sun, 14 Sep 2025 23:48:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jcmvbkbc-xtensa:xtensa-6.16-esp32 24/55] xtensa-linux-gcc: error:
 unrecognized command line option '-mabi=windowed'
Message-ID: <202509142310.iAhT5vKV-lkp@intel.com>
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
TO: Max Filippov <jcmvbkbc@gmail.com>

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.16-esp32
head:   c492d6909ab1d5d30a0d25bf49b19a4b0f5e0fc5
commit: ae435cf52d07063eca3719f8eeaf839c3274b522 [24/55] WIP: xtensa: change default abi to windowed abi
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: xtensa-randconfig-002-20250914 (https://download.01.org/0day-ci/archive/20250914/202509142310.iAhT5vKV-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250914/202509142310.iAhT5vKV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509142310.iAhT5vKV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> xtensa-linux-gcc: error: unrecognized command line option '-mabi=windowed'
>> xtensa-linux-gcc: error: unrecognized command line option '-mabi=windowed'
   make[3]: *** [scripts/Makefile.build:287: scripts/mod/empty.o] Error 1 shuffle=699669312
>> xtensa-linux-gcc: error: unrecognized command line option '-mabi=windowed'
>> xtensa-linux-gcc: error: unrecognized command line option '-mabi=windowed'
   make[3]: *** [scripts/Makefile.build:182: scripts/mod/devicetable-offsets.s] Error 1 shuffle=699669312
   make[3]: Target 'scripts/mod/' not remade because of errors.
   make[2]: *** [Makefile:1273: prepare0] Error 2 shuffle=699669312
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=699669312
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=699669312
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
