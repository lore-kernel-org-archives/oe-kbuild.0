Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603873655D4
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Jun 2026 09:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782208791; cv=none; b=XxU1dZjOeTs+JTn6/AXuPHGjvbzWaWRGfhfLLulHXZj288Rs6wPuUg4YE7dcDiNVV5HGuUg8lbunvsIX7zvDVCIEd6PnomDw0t7YlTrshOnJuZUq095VyGjJhLRW7WNJmXL16TFcaObCX/RBSl17VIUnS4p7kHrcUy0/EN500RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782208791; c=relaxed/simple;
	bh=LKOAFIJNPawsuT5JrINCeVcrco7qr6667BnofoBg1UQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AksgOGL168ZInryzUH5EcuHbQ/G5VIxhz4X2yj+3IyiY3xbTi/urBy1bfoWoomJYCOY6sEgPxJM3ICZ98D0iPlUu4fsOsZg/atAu+GSBG0bJoOwvopzvO+b+qPpI8Bth51ez+N2rs7JGPM9GC0T8JQMSGKWfH4mDfz6LfvlbO/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HHczjEuB; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HHczjEuB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782208789; x=1813744789;
  h=date:from:to:cc:subject:message-id;
  bh=LKOAFIJNPawsuT5JrINCeVcrco7qr6667BnofoBg1UQ=;
  b=HHczjEuB/MsVV9P8rzzgQ14m+x3KiDOG9ftYljcXN9OTHoGr3f1HcuqC
   Q7Yb1SpiC5xzRsQCunuBMO99JEbeZQDU98cc7Qxl4BXqSosgGe6VnMPpW
   ZMd52RjryNnVjKzPKKmtzNNkQnY5slgvMpUByG65Qj10mPRy2UNFVeAcs
   GmKJuwE/YBZioIVjLqtMI2Dg8i30xqNuiCEQoZs6ptiRcFqc3gvWF1HVI
   I0cQFy+zkTRUrZj4OueqfBG3gZeyJQp3ka6ZJriwuPmkwnoWAXtvE5b17
   MS5hdXTJ1JvuQQAgn4eZ0EbxRMkGXgp5cpaW+GBFF5Z6nsSPgbOZKNesH
   A==;
X-CSE-ConnectionGUID: Gyp4sEApTcaFxFLnKTU0hA==
X-CSE-MsgGUID: B8jbqs9gSmibCGokjEhpbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="82989676"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="82989676"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 02:59:49 -0700
X-CSE-ConnectionGUID: b1znrgFhQEyF1orlT+uZcA==
X-CSE-MsgGUID: +piSGm+XRCqhUbEvZSSlwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="254574896"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 23 Jun 2026 02:59:48 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbxuz-000000002Ov-3oan;
	Tue, 23 Jun 2026 09:59:45 +0000
Date: Tue, 23 Jun 2026 17:58:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: error: unknown target CPU 'la32v1.0'
Message-ID: <202606231736.UkUxhmPZ-lkp@intel.com>
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
TO: Huacai Chen <chenhuacai@loongson.cn>

Hi Huacai,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   502d801f0ab03e4f32f9a33d203154ce84887921
commit: 5643c6b2c8308b206cb01cbfd0e6ac80f9f1bc9a LoongArch: Specify -m32/-m64 explicitly for 32BIT/64BIT
date:   7 weeks ago
:::::: branch date: 8 hours ago
:::::: commit date: 7 weeks ago
config: loongarch-randconfig-r133-20260623 (https://download.01.org/0day-ci/archive/20260623/202606231736.UkUxhmPZ-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606231736.UkUxhmPZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 5643c6b2c830 ("LoongArch: Specify -m32/-m64 explicitly for 32BIT/64BIT")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606231736.UkUxhmPZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   WARN /zdci/src/lkp/lib/log.sh:131:in `log_warn': /opt/cross/rustc-1.96.0-bindgen-0.72.1 doesn't exist
     from /zdci/src/kernel-tests/lib/debug.sh:164: kbuild_log_warn
     from /zdci/src/kernel-tests/lib/kbuild.sh:3371: export_rust_path
     from /zdci/src/kernel-tests/lib/kbuild.sh:3361: export_compiler_path
     from /zdci/src/kernel-tests/lib/kbuild.sh:3840: invoke_make
     from /zdci/src/kernel-tests/lib/kbuild.sh:4022: make
     from /zdci/src/kernel-tests/common.sh:202: redirect_error_to_screen
     from /zdci/src/kernel-tests/common.sh:210: redirect_command_errors
     from /zdci/src/kernel-tests/lib/kbuild.sh:5680: make_prepare
     from /zdci/src/kernel-tests/lib/kbuild.sh:5909: test_kernel_build
     from /zdci/src/kernel-tests/lib/builder/base.sh:442: builder_execute_build
     from /zdci/src/kernel-tests/lib/kbuild.sh:6419: compile_one_config
     from /zdci/src/kernel-tests/lib/builder/base.sh:88: builder_compile
     from /zdci/src/kernel-tests/bisect-test-build-error.sh:102: main
>> error: unknown target CPU 'la32v1.0'
   note: valid target CPU values are: loongarch64, la464
>> error: unknown target CPU 'la32v1.0'
   note: valid target CPU values are: loongarch64, la464
>> error: unknown target CPU 'la32v1.0'
   note: valid target CPU values are: loongarch64, la464
   make[3]: *** [scripts/Makefile.build:289: scripts/mod/empty.o] Error 1
   make[3]: *** [scripts/Makefile.build:184: scripts/mod/devicetable-offsets.s] Error 1
   make[3]: Target 'scripts/mod/' not remade because of errors.
   make[2]: *** [Makefile:1372: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
