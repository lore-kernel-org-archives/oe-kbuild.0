Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE1323395F
	for <oe-kbuild@lists.linux.dev>; Thu, 21 May 2026 13:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779371999; cv=none; b=VUJfO1sVJ5GoOOy+KnWaNjxZ4qitApnwJDwmrnrJGTMyQ1k1PAAWfLllB2JTh2BEN75iLrvWN7nKRZaLSTbk3RAdXpIyhUfuF0rWcjwjr9QUFXAC459hSWhrbmPbcotdvZGr+V7zdgZuFnEcArHIhWFQCFmHSHM0o80qBJ1ojNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779371999; c=relaxed/simple;
	bh=QLbaE1WGy5HWpiNbGX8lj+BWF5mTqVjIQB3qgALrqHE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pNsHFaSgD8T50/V5UwDmpN4RJIHXtMlycFAgM6GnsbHu6RWfKqquxtlYT0eSjj0sjlkbzuUWRz1uvsNuW8XiG4PXTEhwcXH85pk/c64VZnEfzoLAcL17DgKoXzEcAdi41HitafUOly46VcvIo5BPULs1F5OZrMZMQXdW/85tF5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c1VTeVNU; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c1VTeVNU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779371998; x=1810907998;
  h=date:from:to:cc:subject:message-id;
  bh=QLbaE1WGy5HWpiNbGX8lj+BWF5mTqVjIQB3qgALrqHE=;
  b=c1VTeVNU8kSGP5xui3aaLpvOce0mw33BLFZKrEV+pKaySYO1kNUoswFT
   yvZoXg9SYCYxsRKZPZazGSaHFWdCDbNL3QVkJIYcNP4I8tZlQRFN/lV9D
   1OQavqh4lJfhK502fdy3abqVXRFtt1OGwkX/KceMAJdh4rlFgIWN91msE
   bYNkJbJIV9bugzgMyX3GamzQf1YBazdhIzSKDj5lPZRyM2nDYmr8KhEEG
   Gu32eB5ReTeBNUxSX8Lfg0xBtNDnlUGvyJtBsTLO2WpL3ORTzL2eECyil
   YfkRF2TzIlMezI4qCoWIBI144chyn+GHvtbuOBVjpQOzuGd0PW5tFsJj5
   w==;
X-CSE-ConnectionGUID: l3DJQKs1S1etPyBk/b/LOw==
X-CSE-MsgGUID: OKhYFz3dQVSOHXyLPa2Gag==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="91397383"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="91397383"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 06:59:57 -0700
X-CSE-ConnectionGUID: 66+eG5UkQDGDIjdnxBj1WA==
X-CSE-MsgGUID: 7jetjaXyQZOqlLzB/d7xXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="234196525"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 21 May 2026 06:59:56 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQ3wI-00000000ArD-1CFh;
	Thu, 21 May 2026 13:59:54 +0000
Date: Thu, 21 May 2026 15:59:12 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 7390/7547] trace/beauty/fsmount.c:37:10:
 fatal error: trace/beauty/generated/fsmount_attr_arrays.c: No such file or
 directory
Message-ID: <202605211515.bBZSRAkp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Arnaldo Carvalho de Melo <acme@redhat.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   550604d6c9b9efc8d068aff94dc301694a7afdee
commit: 61da860eee0798d3ac7d0e20c7771b9128d9ed44 [7390/7547] Merge branch 'perf-tools-next' of https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git
:::::: branch date: 2 hours ago
:::::: commit date: 4 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260521/202605211515.bBZSRAkp-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605211515.bBZSRAkp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605211515.bBZSRAkp-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile.config:565: No elfutils/debuginfod.h found, no debuginfo server support, please install libdebuginfod-dev/elfutils-debuginfod-client-devel or equivalent
   Makefile.config:939: No libllvm 13+ found, slower source file resolution, please install llvm-devel/llvm-dev
   Makefile.config:1135: Rust is not found. Test workloads with rust are disabled.
     PERF_VERSION = 7.1.rc4.g61da860eee07
   trace/beauty/fsmount.c: In function 'fsmount__scnprintf_attr_flags':
>> trace/beauty/fsmount.c:37:10: fatal error: trace/beauty/generated/fsmount_attr_arrays.c: No such file or directory
      37 | #include "trace/beauty/generated/fsmount_attr_arrays.c"
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.
   make[4]: *** [tools/build/Makefile.build:95: trace/beauty/fsmount.o] Error 1
   make[4]: *** Waiting for unfinished jobs....
   In file included from builtin-trace.c:56:
   trace/beauty/beauty.h:17:57: error: 'strarray__fsmount_flags' defined but not used [-Werror=unused-variable]
      17 | #define DEFINE_STRARRAY(array, _prefix) struct strarray strarray__##array = { \
         |                                                         ^~~~~~~~~~
   builtin-trace.c:789:8: note: in expansion of macro 'DEFINE_STRARRAY'
     789 | static DEFINE_STRARRAY(fsmount_flags, "FSMOUNT_");
         |        ^~~~~~~~~~~~~~~
   make[3]: *** [tools/build/Makefile.build:158: trace/beauty] Error 2
   make[3]: *** Waiting for unfinished jobs....
   cc1: all warnings being treated as errors
   make[3]: *** [tools/build/Makefile.build:95: builtin-trace.o] Error 1
   make[2]: *** [Makefile.perf:549: perf-in.o] Error 2
   make[1]: *** [Makefile.perf:288: sub-make] Error 2

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
