Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E921A379997
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Feb 2026 15:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770650335; cv=none; b=aU80gU0tQ/x19oLu2ouh9tsRQwFe3p4kKxbMMoD2ghDkC7Act3D+Xxft6jL4rSvKZcxrBwhqzc676pJuY8laZKTu852+3WWrbG0NR+87BdOW8dCRP0eH5G4Io0G0pcFZCGxpd2eUHUR2dvlsNHa8dNTwCcxBDupFmzpe3PIPqJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770650335; c=relaxed/simple;
	bh=sKcl5f4OpU5hqGYnhzA90wwT3WEhgY43vtUXBgNOp0g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QKKTcoOeOQtqLk0ZAdPqlZ0kj0cpOfPSpr5n/WGbCwJ/cRw4ZZb8dTEzgwI4r3I+kwbIZJ3GaRAX6Rc0QWTE3exvaEc+LLUH9liQC3t51qsGWPPpe07YOXTgwl+yYHwQFctUH+D3EHX8tdjdbm+OdqK5m1F3QOjssL9FMi4/bGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SjOUxkCZ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SjOUxkCZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770650334; x=1802186334;
  h=date:from:to:cc:subject:message-id;
  bh=sKcl5f4OpU5hqGYnhzA90wwT3WEhgY43vtUXBgNOp0g=;
  b=SjOUxkCZQNwH3WXgM2mNSz7S04wgvur8U4dQmjazzg+bFNw2H220ukYm
   crcSIz+3DZvjsHvj1B/lpdnQNz2488all/WlhwlaAbqDS24r9ReDiGtkT
   s60gv0ANzaTsxS+AYc2KhASmwgyO0sr4GK7mLUKDltOQW4UEI1TkcOOqp
   opn5yp7C7Vkp9Q4OOa6RS2CAGrrjh7fJiEio7dJq1+lRgipsnZiKRGdyH
   lLE/nyYUbmZvYERq9W6Qr+oucjYyHrPKhkRCUUAHVioXX0bMiQCv7X/Su
   YeoclRaLuq7eig2uxkuVAjQzzgFt+5DChUJMF3ytD9KIMY82QOSgpHu0e
   g==;
X-CSE-ConnectionGUID: 3EWbrkjqQ+efBKoTQ0in6Q==
X-CSE-MsgGUID: 30EJT/uwQl2VTkG6PqVU0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="83203494"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="83203494"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 07:18:54 -0800
X-CSE-ConnectionGUID: W8gV7lEbRmi2/s+z2Rh+4w==
X-CSE-MsgGUID: uTUeRtPsSge0Xk6C51xzpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="216105313"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 09 Feb 2026 07:18:52 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpT2I-000000000H3-2dbU;
	Mon, 09 Feb 2026 15:18:50 +0000
Date: Mon, 09 Feb 2026 16:18:44 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 11682/12094] getdelays.c:209:15: error:
 invalid use of undefined type 'struct timespec64'
Message-ID: <202602091611.lxgINqXp-lkp@intel.com>
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
head:   9845cf73f7db6094c0d8419d6adb848028f4a921
commit: f06e31eef4c1496f2e1e6accd8d3764744742d92 [11682/12094] delayacct: fix uapi timespec64 definition
:::::: branch date: 4 days ago
:::::: commit date: 5 days ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260209/202602091611.lxgINqXp-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260209/202602091611.lxgINqXp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602091611.lxgINqXp-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> getdelays.c:202:45: warning: 'struct timespec64' declared inside parameter list will not be visible outside of this definition or declaration
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
