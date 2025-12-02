Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF5D1CD2C
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Dec 2025 05:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764652201; cv=none; b=aT8Y2nOt30pjG2lr9j4+4TXarjPI8wgVvlJGjAzRsBbfDjbP6vIIPTtgl8zEeJJsdMMSUicM6FWOKYqKSTvHgPsrDaK8LG124epUMOYeKaHA7sSkueAc+qJQzgnXHMS6WRyDaZTFD7FXWsoyiRcI4oNDOX6cI4Z7eMlM/i8tEyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764652201; c=relaxed/simple;
	bh=NeR565m7t38cChipYNaIiaIwWQ3mGKhH355ZcrdrzsM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sXZvLtXUiuM5uvD+ibxADhFr9OEiwkSwy4HMU/XX7a1Xa73LsCxFBTMEUT9C0Zeijf3tV701tNGfs9yH9rLyYPe9SRI+cE1t0KdAGb5tFc+JdnBGjjo5OEUVJEI19z4YuVKP5t9EfX1/w/Q3yK9s5Z9fSsYDYSMlB60yBZfgf70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kikvD6yT; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kikvD6yT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764652200; x=1796188200;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=NeR565m7t38cChipYNaIiaIwWQ3mGKhH355ZcrdrzsM=;
  b=kikvD6yTFEJ8nzgNOR9Bd6u4hUYIUEF3oOz+N0e+wG/fMSNyomQ7x43w
   +HvgOur+9vXcf4XehTqOPmJAVddfbqFoAjoZMMMPILkVLJlGPjzxEDMu8
   68pPXwLkWh+0kNX4wf0xJ7ndq3oAC77OVIcEFwPrGv/pDwI6EL2g648c8
   kXIZJq9h8SU8iuQqxRNpD4q4xRrVPiBq14f9ilIxeuH/Vef465uZNVWNS
   ydhxQHhieKEoMegJlblmVY5vbOOtcqcpFlpIAE/PqnhyXfTYMfG8OJpD9
   GBhFqYvSri5uTV8cyENtcs/hQjIxm0Sw3N+jZ5qU/psKP7dPlT4KrSRlh
   g==;
X-CSE-ConnectionGUID: Hm5cGaXCQ9OAMPKUIcvgTA==
X-CSE-MsgGUID: PdyLdy8ASOKmjwJdQNlHHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="78074930"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="78074930"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 21:09:58 -0800
X-CSE-ConnectionGUID: jPLa6XY1TMy5lv3s/HdKIw==
X-CSE-MsgGUID: vWhLxbDYSMKZ1vKuAZsT5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="194705301"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 01 Dec 2025 21:09:57 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQIeA-000000009QX-2YV7;
	Tue, 02 Dec 2025 05:09:54 +0000
Date: Tue, 2 Dec 2025 13:09:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 12434/13171]
 tools/testing/selftests/../../../tools/testing/selftests/kselftest_harness.h:56:10:
 fatal error: asm/types.h: No such file or directory
Message-ID: <202512021349.T28UlTtp-lkp@intel.com>
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
TO: "Bala-Vignesh-Reddy" <reddybalavignesh9979@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Wei Yang <richard.weiyang@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a
commit: e6fbd1759c9ece5044d3470f30a5e2166dc9de89 [12434/13171] selftests: complete kselftest include centralization
:::::: branch date: 26 hours ago
:::::: commit date: 4 days ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251202/202512021349.T28UlTtp-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512021349.T28UlTtp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512021349.T28UlTtp-lkp@intel.com/

Note: the linux-next/master HEAD 95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from proc-maps-race.c:26:
>> tools/testing/selftests/../../../tools/testing/selftests/kselftest_harness.h:56:10: fatal error: asm/types.h: No such file or directory
      56 | #include <asm/types.h>
         |          ^~~~~~~~~~~~~
   compilation terminated.
--
   In file included from set_syscall_info.c:10:
>> tools/testing/selftests/../../../tools/testing/selftests/kselftest_harness.h:57:10: fatal error: ctype.h: No such file or directory
      57 | #include <ctype.h>
         |          ^~~~~~~~~
   compilation terminated.
--
   In file included from hmm-tests.c:13:
>> tools/testing/selftests/../../../tools/testing/selftests/kselftest_harness.h:57:10: fatal error: ctype.h: No such file or directory
      57 | #include <ctype.h>
         |          ^~~~~~~~~
   compilation terminated.
   vm_util.c:2:10: fatal error: string.h: No such file or directory
       2 | #include <string.h>
         |          ^~~~~~~~~~
   compilation terminated.
   thp_settings.c:2:10: fatal error: fcntl.h: No such file or directory
       2 | #include <fcntl.h>
         |          ^~~~~~~~~
   compilation terminated.


vim +56 tools/testing/selftests/../../../tools/testing/selftests/kselftest_harness.h

c99ee51a9d9716 tools/testing/selftests/seccomp/test_harness.h Kees Cook        2015-06-16  52  
e80068be21824e tools/testing/selftests/kselftest_harness.h    Kees Cook        2020-06-22  53  #ifndef _GNU_SOURCE
cee27ae5f1fb8b tools/testing/selftests/kselftest_harness.h    Shuah Khan       2024-05-16  54  #define _GNU_SOURCE
e80068be21824e tools/testing/selftests/kselftest_harness.h    Kees Cook        2020-06-22  55  #endif
369130b63178e0 tools/testing/selftests/kselftest_harness.h    Mickaël Salaün   2017-08-07 @56  #include <asm/types.h>
65177e47d3035c tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2023-01-25 @57  #include <ctype.h>
369130b63178e0 tools/testing/selftests/kselftest_harness.h    Mickaël Salaün   2017-08-07  58  #include <errno.h>
73a3cde9767793 tools/testing/selftests/kselftest_harness.h    Thomas Weißschuh 2025-05-05  59  #include <linux/unistd.h>
73a3cde9767793 tools/testing/selftests/kselftest_harness.h    Thomas Weißschuh 2025-05-05  60  #include <poll.h>
369130b63178e0 tools/testing/selftests/kselftest_harness.h    Mickaël Salaün   2017-08-07  61  #include <stdbool.h>
b5bb6d3068eabb tools/testing/selftests/seccomp/test_harness.h Kees Cook        2015-12-10  62  #include <stdint.h>
c99ee51a9d9716 tools/testing/selftests/seccomp/test_harness.h Kees Cook        2015-06-16  63  #include <stdio.h>
c99ee51a9d9716 tools/testing/selftests/seccomp/test_harness.h Kees Cook        2015-06-16  64  #include <stdlib.h>
c99ee51a9d9716 tools/testing/selftests/seccomp/test_harness.h Kees Cook        2015-06-16  65  #include <string.h>
0ef67a888375b0 tools/testing/selftests/kselftest_harness.h    Kees Cook        2020-06-22  66  #include <sys/mman.h>
c99ee51a9d9716 tools/testing/selftests/seccomp/test_harness.h Kees Cook        2015-06-16  67  #include <sys/types.h>
c99ee51a9d9716 tools/testing/selftests/seccomp/test_harness.h Kees Cook        2015-06-16  68  #include <sys/wait.h>
c99ee51a9d9716 tools/testing/selftests/seccomp/test_harness.h Kees Cook        2015-06-16  69  #include <unistd.h>
c99ee51a9d9716 tools/testing/selftests/seccomp/test_harness.h Kees Cook        2015-06-16  70  

:::::: The code at line 56 was first introduced by commit
:::::: 369130b63178e0e2f863a2da2a5ad0238ded6d9d selftests: Enhance kselftest_harness.h to print which assert failed

:::::: TO: Mickaël Salaün <mic@digikod.net>
:::::: CC: Shuah Khan <shuahkh@osg.samsung.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
