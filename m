Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5561636
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Jan 2024 00:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706055831; cv=none; b=YA8z6BzwRqgZugylu9hg7mR7P9rEw9i4zucA1asRttxi+Pni7vJ2iyy9+da3f5zr/d3U3NCIh0GGEqSy3gaIU6wYoQ5aMAH9OqfMNjwHfPFdYZ/mldxUFHZAtHL7VLaeTrhDJJms8Yhzv1Lm4hdGyvbRf1zS9pxPs+TVp4re2IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706055831; c=relaxed/simple;
	bh=rucE9/suFxgkjhoTSsuiBphT0r3032wr4py4IYy0lS4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FzXGz9v2/1ocokn5s7voLjkj1Da5QxC3vWYPzepm+nxHojmDYIujwZcSlpVjZNakj3kiEdbjNPAD8Cl7KVBaHxG9gJ5CvE7M56yj/EA1PiJBPabWuiSINm1LidMfa4NNK34R5/+wxoYOSvSAMBE1wONA4X9/WbgVTXgXvBBpAW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l9JX5SF4; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l9JX5SF4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706055821; x=1737591821;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rucE9/suFxgkjhoTSsuiBphT0r3032wr4py4IYy0lS4=;
  b=l9JX5SF4CKbh/jyrhPBXPGJgHwgz9zkhrh5BvEyS6fLRm+FLjerfaXbO
   p1JNEiCrBjieWs78WBZ7TfsgHbap++RH+N5MRe+I67ttPTy+ZXu0A4+46
   8yTKINUMqS9ndUcF1ZpdZz80aSkw+XYg3OO/laelaKw2G4c9Z8xR0u0i7
   QelvVSHfRsAocMHjnOoUBw48PDJMY9XN4UqwQqN3nQdeApF8sXd+2TCkn
   7ijb/15fe7SJ9xYomRm19fJZButkYkVDFqQBuuPl/33LGtJ1vrrUhC57u
   MxKa2yg5Puw5EKv5dvGDvXQOgsHiROHZ/93Ycj4rN0yDq299OIBjIpa3M
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="15048367"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="15048367"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 16:23:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="1796436"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 23 Jan 2024 16:23:39 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSR3J-0007kn-2O;
	Wed, 24 Jan 2024 00:23:37 +0000
Date: Wed, 24 Jan 2024 08:23:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [openeuler:OLK-6.6 701/2572] error: unknown target ABI 'ilp32'
Message-ID: <202401240826.LYPXGZh0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only kconfig file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: kernel@openeuler.org

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a662a03b9d1d5b93551f9c0f9c2875373b223115
commit: f9b54a6714445cde83aeff0318cf767b3b81229d [701/2572] arm64:ilp32: add ARM64_ILP32 to Kconfig
:::::: branch date: 15 hours ago
:::::: commit date: 8 weeks ago
config: arm64-randconfig-003-20240124 (https://download.01.org/0day-ci/archive/20240124/202401240826.LYPXGZh0-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240124/202401240826.LYPXGZh0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401240826.LYPXGZh0-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/arm64/kernel/vdso-ilp32/Makefile:87: FORCE prerequisite is missing
   arch/arm64/kernel/vdso-ilp32/Makefile:84: FORCE prerequisite is missing
   arch/arm64/kernel/vdso-ilp32/Makefile:90: FORCE prerequisite is missing
>> clang-15: warning: -Wl,-soname=linux-ilp32-vdso.so.1: 'linker' input unused [-Wunused-command-line-argument]
>> error: unknown target ABI 'ilp32'
>> error: unknown target ABI 'ilp32'
   make[3]: *** [scripts/Makefile.build:373: arch/arm64/kernel/vdso-ilp32/vdso-ilp32.lds] Error 1 shuffle=2640098190
   make[3]: *** [arch/arm64/kernel/vdso-ilp32/Makefile:84: arch/arm64/kernel/vdso-ilp32/vgettimeofday-ilp32.o] Error 1 shuffle=2640098190
>> error: unknown target ABI 'ilp32'
   make[3]: *** [arch/arm64/kernel/vdso-ilp32/Makefile:87: arch/arm64/kernel/vdso-ilp32/note-ilp32.o] Error 1 shuffle=2640098190
>> error: unknown target ABI 'ilp32'
   make[3]: *** [arch/arm64/kernel/vdso-ilp32/Makefile:90: arch/arm64/kernel/vdso-ilp32/sigreturn-ilp32.o] Error 1 shuffle=2640098190
   make[3]: Target 'include/generated/vdso-ilp32-offsets.h' not remade because of errors.
   make[2]: *** [arch/arm64/Makefile:201: vdso_prepare] Error 2 shuffle=2640098190
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=2640098190
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=2640098190
   make: Target 'prepare' not remade because of errors.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARM64_ERRATUM_845719
   Depends on [n]: AARCH32_EL0 [=n]
   Selected by [y]:
   - ARCH_MXC [=y] && ARCH_NXP [=y] && COMPAT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
