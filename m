Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AEC1A0B15
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Feb 2026 20:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770843332; cv=none; b=IRSGk8/UBraxtDNnCIseE85eCjHPBZEiS+HG8MXSOjeTPLHhte1ZfB0Nj9XwQf4a8v9X0p7XBbAm0lzfa1j4pfx87VlAVmmDSapvqexN0BGRiXsPbBn4oK0b8YEaRFbALZGUy9+JafgLHWBvl1jBJ5zNOIDjNsPt8h80qveTNN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770843332; c=relaxed/simple;
	bh=0DVXC039Cd597s+WJr4rmEJOQaEUK1YYFEzOv6SkfT8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O7xoFU34tUd04eqZODZN7UW6gObSKuifg3I4nIZjyxz7p7unQ0hBX2eYYBLfYMyrplabpcq2uiBe3MgN0DXAEFTiI+5UGiLCFzeI/K0Vkmukj4Up9T9CaEb72n7BhbczyQZi0UrcvEuQhMGg98ZzhGsuNzMbGmzKJz2Q2XLD6r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GIvDii/c; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GIvDii/c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770843330; x=1802379330;
  h=date:from:to:cc:subject:message-id;
  bh=0DVXC039Cd597s+WJr4rmEJOQaEUK1YYFEzOv6SkfT8=;
  b=GIvDii/cMIxCEdDBNcxrnl6qDWmm/HPz8QkMzigFPyuop061HBJ07eBg
   nTT2pXPjLLsvZCtwPePK/IZacL2hlqfXsWlwR2Qq4idGbjRLhJQRcRrYv
   6SFV/pws0SXy1trgoz3Hbi9GPngIewyEIe3WqyBpHz5Px6DMVeAvGR4uN
   V+v22C4ZlNqBVs6ErBEuvBW23dGQ529AMOvwE0ogOo5vVtmsQy4vprz2U
   JBOMNN5a/y+eIgUaggo/WPYQwWpL3HbZXMfMhDDjcYpevyjPEBdF8+CeV
   yEuFipMK1HfaViFu86O1fv945bjXjZKQAP7W8QhpCCrowikqnOuljJ5nm
   Q==;
X-CSE-ConnectionGUID: 13ZGW6MTRgmHN2P4NH0tlw==
X-CSE-MsgGUID: CLEZ03cAQEW5Yya6Vju1oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="94641546"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="94641546"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 12:55:30 -0800
X-CSE-ConnectionGUID: EUrbYOADSF+UYsOVpjx8sQ==
X-CSE-MsgGUID: OXM1ZqhGTnKKpCiirCLphg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="212189449"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 11 Feb 2026 12:55:29 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqHF9-0000000019r-0Vv0;
	Wed, 11 Feb 2026 20:55:27 +0000
Date: Wed, 11 Feb 2026 21:55:08 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 11810/12577] getdelays.c:209:15: error:
 invalid use of undefined type 'struct timespec64'
Message-ID: <202602112136.G3TiW6gu-lkp@intel.com>
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
TO: Arnd Bergmann <arnd@arndb.de>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9152bc8cebcb14dc16b03ec81f2377ee8ce12268
commit: 90079798f1d748e97c74e23736491543577b8aee [11810/12577] delayacct: fix uapi timespec64 definition
:::::: branch date: 7 hours ago
:::::: commit date: 4 days ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260211/202602112136.G3TiW6gu-lkp@intel.com/config)
compiler: riscv64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602112136.G3TiW6gu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602112136.G3TiW6gu-lkp@intel.com/

Note: the linux-next/master HEAD 9152bc8cebcb14dc16b03ec81f2377ee8ce12268 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   getdelays.c:202:45: warning: 'struct timespec64' declared inside parameter list will not be visible outside of this definition or declaration
     202 | static const char *format_timespec64(struct timespec64 *ts)
         |                                             ^~~~~~~~~~
   getdelays.c: In function 'format_timespec64':
>> getdelays.c:209:15: error: invalid use of undefined type 'struct timespec64'
     209 |         if (ts->tv_sec == 0 && ts->tv_nsec == 0)
         |               ^~
   getdelays.c:209:34: error: invalid use of undefined type 'struct timespec64'
     209 |         if (ts->tv_sec == 0 && ts->tv_nsec == 0)
         |                                  ^~
   getdelays.c:212:30: error: invalid use of undefined type 'struct timespec64'
     212 |         time_sec = (time_t)ts->tv_sec;
         |                              ^~
   getdelays.c: In function 'print_delayacct':
>> getdelays.c:260:51: error: passing argument 1 of 'format_timespec64' from incompatible pointer type [-Wincompatible-pointer-types]
     260 |                                 format_timespec64(&(t)->cpu_delay_max_ts)); \
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~
         |                                                   |
         |                                                   struct __kernel_timespec *
   getdelays.c:344:9: note: in expansion of macro 'PRINT_CPU_DELAY'
     344 |         PRINT_CPU_DELAY(t->version, t);
         |         ^~~~~~~~~~~~~~~
   getdelays.c:202:57: note: expected 'struct timespec64 *' but argument is of type 'struct __kernel_timespec *'
     202 | static const char *format_timespec64(struct timespec64 *ts)
         |                                      ~~~~~~~~~~~~~~~~~~~^~
   getdelays.c:319:51: error: passing argument 1 of 'format_timespec64' from incompatible pointer type [-Wincompatible-pointer-types]
     319 |                                 format_timespec64(&(t)->max_ts)); \
         |                                                   ^
         |                                                   |
         |                                                   struct __kernel_timespec *
   getdelays.c:348:17: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_TS'
     348 |                 PRINT_FILED_DELAY_WITH_TS("IO", t->version, t,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   getdelays.c:202:57: note: expected 'struct timespec64 *' but argument is of type 'struct __kernel_timespec *'
     202 | static const char *format_timespec64(struct timespec64 *ts)
         |                                      ~~~~~~~~~~~~~~~~~~~^~
   getdelays.c:319:51: error: passing argument 1 of 'format_timespec64' from incompatible pointer type [-Wincompatible-pointer-types]
     319 |                                 format_timespec64(&(t)->max_ts)); \
         |                                                   ^
         |                                                   |
         |                                                   struct __kernel_timespec *
   getdelays.c:352:17: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_TS'
     352 |                 PRINT_FILED_DELAY_WITH_TS("SWAP", t->version, t,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   getdelays.c:202:57: note: expected 'struct timespec64 *' but argument is of type 'struct __kernel_timespec *'
     202 | static const char *format_timespec64(struct timespec64 *ts)
         |                                      ~~~~~~~~~~~~~~~~~~~^~
   getdelays.c:319:51: error: passing argument 1 of 'format_timespec64' from incompatible pointer type [-Wincompatible-pointer-types]
     319 |                                 format_timespec64(&(t)->max_ts)); \
         |                                                   ^
         |                                                   |
         |                                                   struct __kernel_timespec *
   getdelays.c:356:17: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_TS'
     356 |                 PRINT_FILED_DELAY_WITH_TS("RECLAIM", t->version, t,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   getdelays.c:202:57: note: expected 'struct timespec64 *' but argument is of type 'struct __kernel_timespec *'
     202 | static const char *format_timespec64(struct timespec64 *ts)
         |                                      ~~~~~~~~~~~~~~~~~~~^~
   getdelays.c:319:51: error: passing argument 1 of 'format_timespec64' from incompatible pointer type [-Wincompatible-pointer-types]
     319 |                                 format_timespec64(&(t)->max_ts)); \
         |                                                   ^
         |                                                   |
         |                                                   struct __kernel_timespec *
   getdelays.c:360:17: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_TS'
     360 |                 PRINT_FILED_DELAY_WITH_TS("THRASHING", t->version, t,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   getdelays.c:202:57: note: expected 'struct timespec64 *' but argument is of type 'struct __kernel_timespec *'
     202 | static const char *format_timespec64(struct timespec64 *ts)
         |                                      ~~~~~~~~~~~~~~~~~~~^~
   getdelays.c:319:51: error: passing argument 1 of 'format_timespec64' from incompatible pointer type [-Wincompatible-pointer-types]
     319 |                                 format_timespec64(&(t)->max_ts)); \
         |                                                   ^
         |                                                   |
         |                                                   struct __kernel_timespec *
   getdelays.c:365:25: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_TS'
     365 |                         PRINT_FILED_DELAY_WITH_TS("COMPACT", t->version, t,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   getdelays.c:202:57: note: expected 'struct timespec64 *' but argument is of type 'struct __kernel_timespec *'
     202 | static const char *format_timespec64(struct timespec64 *ts)
         |                                      ~~~~~~~~~~~~~~~~~~~^~
   getdelays.c:319:51: error: passing argument 1 of 'format_timespec64' from incompatible pointer type [-Wincompatible-pointer-types]
     319 |                                 format_timespec64(&(t)->max_ts)); \
         |                                                   ^
         |                                                   |
         |                                                   struct __kernel_timespec *
   getdelays.c:371:25: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_TS'
     371 |                         PRINT_FILED_DELAY_WITH_TS("WPCOPY", t->version, t,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   getdelays.c:202:57: note: expected 'struct timespec64 *' but argument is of type 'struct __kernel_timespec *'
     202 | static const char *format_timespec64(struct timespec64 *ts)
         |                                      ~~~~~~~~~~~~~~~~~~~^~
   getdelays.c:319:51: error: passing argument 1 of 'format_timespec64' from incompatible pointer type [-Wincompatible-pointer-types]
     319 |                                 format_timespec64(&(t)->max_ts)); \
         |                                                   ^
         |                                                   |
         |                                                   struct __kernel_timespec *
   getdelays.c:377:25: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_TS'
     377 |                         PRINT_FILED_DELAY_WITH_TS("IRQ", t->version, t,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   getdelays.c:202:57: note: expected 'struct timespec64 *' but argument is of type 'struct __kernel_timespec *'
     202 | static const char *format_timespec64(struct timespec64 *ts)
         |                                      ~~~~~~~~~~~~~~~~~~~^~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
