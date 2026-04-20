Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F124738238C
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Apr 2026 09:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776678485; cv=none; b=ZfIinB7Gth5sclL1sE36EzhJqZSqy+Tcsy3iZzoOmME9KIGsT6KLyQR7U179gM1pkaUDq23GgKyxAKqjQmYbrsdYhEaGSshknombXKZaWHXfpRyVBqI41Lsk+NbhJnC8ntLSHSgPE/Ai0ylIXOcosL5uMEDUma0X//KqHfLdFm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776678485; c=relaxed/simple;
	bh=xKLFSHzmv47L1Ytr/wv4BYDWKckNh2iT5QZXOdTqosE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Pqe7ep3pbeEGVmBHFM/PO4PkizA717jKMhJ+sBfmwFsjvPfDrgAnFnA69bnEbqvkG5FmEv5WuXv01wpbZ7KnBXYDa78sjgF54hFoO+lhnhZkiE9TTrwLA6FeZmFAs3+4MXhQSQCdn6LOh6LXiR8dwcnV1v2P98JlySw0aqyKdfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SKqY9XmH; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SKqY9XmH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776678483; x=1808214483;
  h=date:from:to:cc:subject:message-id;
  bh=xKLFSHzmv47L1Ytr/wv4BYDWKckNh2iT5QZXOdTqosE=;
  b=SKqY9XmHqgCe707JQsROg4Cpd4qF9s/HgS6+kX4EX8oXsSzKbPfodVMk
   TffQ5RL7pgKLHvT8JKi0s4gFueKbVlYOlsa1CVysL0sg22AfrleJv4Jls
   Vj8cIE4QCKuxSJWbAnqkY4Bbknih+uGn/RyssyCPq0eZLrQJ6yQqC+pGb
   7hbDUPYzLVpIwPCsoXLa5a19mPFJ8WK/9vL0tMwuY5Znf7Zq3KSuqfe72
   1ph/QDjq70Q0BPw21OfmwjPkfKnHN0wucOVYAgAMsPf8s91asHCkZeUBm
   hUVVfRpidkvJlpynQklbguMfpmYGOyqF/diiQtvyrVFsMDXek5cv5hlI6
   g==;
X-CSE-ConnectionGUID: ObOuyR6CQ1iLiQlFkgF2Dg==
X-CSE-MsgGUID: FOmULqtMQ7+UC8EZktIu3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77467455"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; 
   d="scan'208";a="77467455"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 02:48:02 -0700
X-CSE-ConnectionGUID: gCSy76MuR3q3BDd2ldCt6w==
X-CSE-MsgGUID: I8mvZN8XRJepQEb1tKoTtA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 20 Apr 2026 02:48:01 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wElEV-000000002FJ-1jTS;
	Mon, 20 Apr 2026 09:47:59 +0000
Date: Mon, 20 Apr 2026 11:47:42 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android-mainline 21/21] getdelays.c:209:15:
 error: invalid use of undefined type 'struct timespec64'
Message-ID: <202604201101.L4ozob66-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

Hi Arnd,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   09656f44f887e2d9d09d7dc785e17b320dacfa54
commit: 90079798f1d748e97c74e23736491543577b8aee [21/21] delayacct: fix uapi timespec64 definition
:::::: branch date: 2 hours ago
:::::: commit date: 2 months ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260420/202604201101.L4ozob66-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260420/202604201101.L4ozob66-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604201101.L4ozob66-lkp@intel.com/

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
