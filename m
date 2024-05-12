Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157672E620
	for <oe-kbuild@lists.linux.dev>; Sun, 12 May 2024 19:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715542153; cv=none; b=Zz5fJ73DNZHmSpvatGvWnnzpQOW1MqjZNLgElNYKP35esILsoibEyP+mhozbnMleFCz1+A7YxDdJLp7YAYe4QkoLvzt3zA6A0q1aTKyPUR+sKp9v9iRL3cs0uuVcayf9AGc1AKzKxvyV8zXxZCRpX0cwMFwY4hl/u6ZMbUvgQGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715542153; c=relaxed/simple;
	bh=MAYiRKyNL+cYX+R/GRhzbFSm/wFjMMkR0VO2q/eDY1E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Irow/7qYp3tVh9Bn585XFh7cP69tQN5yMUB07Lq9rnp6IpUo1O088p7dSMVofCJ2w+x3fJrmDwTB1IGv4gdUgEjh5tHNKHJz3ilOeJiokXn0I+Xp4aTxUvNOHIXhNQLvblLJHXxnEgQbO/4G6sqTDgR2tTKYlpBcSsWXASSeW2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EDD5DMqc; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EDD5DMqc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715542151; x=1747078151;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=MAYiRKyNL+cYX+R/GRhzbFSm/wFjMMkR0VO2q/eDY1E=;
  b=EDD5DMqc3aj8ekZy7r0693u1a1DwuETJfPNSXOV00cEde4elur0GZvbJ
   5MG7nl3cjXH6qSc8+cQawql5eTF8LtZ1Pqrndur1R3HZOfic7LJpVEYy1
   jotDMoZRxnWHyVOlFpWz47apPS0r9yGxqvHBLY4HYzVC38iTZsaAg/EK4
   LTdiH0L4q4S47RUsq3eK2jihbAPvLtuZsaIEPQLjuBNjmA6+XKa4hJTh9
   zLscTZIlmKoKImaQdDT2kJw3ZEv1+FSmqnWnfH+Un0TS0H3XqlCg8mY2h
   a2gxFhpKNDO/P/6s0WHiBP0d39Fc1cGikNC7C4aWOHptUoiWgR/skHQvv
   Q==;
X-CSE-ConnectionGUID: J7tLZlGpRwOIvRCAlPP0dg==
X-CSE-MsgGUID: fS9O6LmoRWWFtZ0f8p4J6g==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11598838"
X-IronPort-AV: E=Sophos;i="6.08,156,1712646000"; 
   d="scan'208";a="11598838"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2024 12:29:10 -0700
X-CSE-ConnectionGUID: LPZl/FfESzuvKOiRkUs2rw==
X-CSE-MsgGUID: AyFhpi8mQqibBBVcxr7UWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,156,1712646000"; 
   d="scan'208";a="29977954"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 May 2024 12:29:08 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6Esc-0008rb-0S;
	Sun, 12 May 2024 19:29:06 +0000
Date: Mon, 13 May 2024 03:28:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 12023/12533] ./../kselftest_harness.h:54:15:
 error: expected parameter declarator
Message-ID: <202405130312.R5mxIDyQ-lkp@intel.com>
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
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Edward Liaw <edliaw@google.com>
CC: Shuah Khan <skhan@linuxfoundation.org>
CC: Muhammad Usama Anjum <usama.anjum@collabora.com>
CC: Mark Brown <broonie@kernel.org>
CC: John Hubbard <jhubbard@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   75fa778d74b786a1608d55d655d42b480a6fa8bd
commit: daef47b89efd0b745e8478d69a3ad724bd8b4dc6 [12023/12533] selftests: Compile kselftest headers with -D_GNU_SOURCE
:::::: branch date: 3 days ago
:::::: commit date: 4 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240513/202405130312.R5mxIDyQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405130312.R5mxIDyQ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from hid_bpf.c:5:
>> ./../kselftest_harness.h:54:15: error: expected parameter declarator
      54 | static_assert(0, "kselftest harness requires _GNU_SOURCE to be defined");
         |               ^
>> ./../kselftest_harness.h:54:15: error: expected ')'
   ./../kselftest_harness.h:54:14: note: to match this '('
      54 | static_assert(0, "kselftest harness requires _GNU_SOURCE to be defined");
         |              ^
>> ./../kselftest_harness.h:54:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      54 | static_assert(0, "kselftest harness requires _GNU_SOURCE to be defined");
         | ^
         | int
   3 errors generated.
--
>> reuseport_bpf_cpu.c:15:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefined]
      15 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> reuseport_bpf_numa.c:7:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefined]
       7 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> reuseport_dualstack.c:14:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefined]
      14 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> tls.c:3:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefined]
       3 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> tun.c:3:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefined]
       3 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> tap.c:3:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefined]
       3 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> so_incoming_cpu.c:3:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefined]
       3 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> nettest.c:7:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefined]
       7 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> psock_fanout.c:30:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefined]
      30 | #define _GNU_SOURCE             /* for sched_setaffinity */
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> msg_zerocopy.c:28:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefined]
      28 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
..


vim +54 tools/testing/selftests/hid/./../kselftest_harness.h

c99ee51a9d9716 tools/testing/selftests/seccomp/test_harness.h Kees Cook      2015-06-16  52  
e80068be21824e tools/testing/selftests/kselftest_harness.h    Kees Cook      2020-06-22  53  #ifndef _GNU_SOURCE
daef47b89efd0b tools/testing/selftests/kselftest_harness.h    Edward Liaw    2024-05-07 @54  static_assert(0, "kselftest harness requires _GNU_SOURCE to be defined");
e80068be21824e tools/testing/selftests/kselftest_harness.h    Kees Cook      2020-06-22  55  #endif
369130b63178e0 tools/testing/selftests/kselftest_harness.h    Mickaël Salaün 2017-08-07  56  #include <asm/types.h>
65177e47d3035c tools/testing/selftests/kselftest_harness.h    Jakub Kicinski 2023-01-25  57  #include <ctype.h>
369130b63178e0 tools/testing/selftests/kselftest_harness.h    Mickaël Salaün 2017-08-07  58  #include <errno.h>
369130b63178e0 tools/testing/selftests/kselftest_harness.h    Mickaël Salaün 2017-08-07  59  #include <stdbool.h>
b5bb6d3068eabb tools/testing/selftests/seccomp/test_harness.h Kees Cook      2015-12-10  60  #include <stdint.h>
c99ee51a9d9716 tools/testing/selftests/seccomp/test_harness.h Kees Cook      2015-06-16  61  #include <stdio.h>
c99ee51a9d9716 tools/testing/selftests/seccomp/test_harness.h Kees Cook      2015-06-16  62  #include <stdlib.h>
c99ee51a9d9716 tools/testing/selftests/seccomp/test_harness.h Kees Cook      2015-06-16  63  #include <string.h>
0ef67a888375b0 tools/testing/selftests/kselftest_harness.h    Kees Cook      2020-06-22  64  #include <sys/mman.h>
c99ee51a9d9716 tools/testing/selftests/seccomp/test_harness.h Kees Cook      2015-06-16  65  #include <sys/types.h>
c99ee51a9d9716 tools/testing/selftests/seccomp/test_harness.h Kees Cook      2015-06-16  66  #include <sys/wait.h>
c99ee51a9d9716 tools/testing/selftests/seccomp/test_harness.h Kees Cook      2015-06-16  67  #include <unistd.h>
63e6b2a42342c3 tools/testing/selftests/kselftest_harness.h    Kees Cook      2022-03-24  68  #include <setjmp.h>
c99ee51a9d9716 tools/testing/selftests/seccomp/test_harness.h Kees Cook      2015-06-16  69  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
