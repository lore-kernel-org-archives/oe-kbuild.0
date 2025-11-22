Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B065C156678
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Nov 2025 13:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763817524; cv=none; b=c0GtZ5gGdI+mukKp2IjJ4xmhL6+w+K9wI5hveKeE0qtyZQ+5fHFz1AlSWcDzuZAfgrKFgLLPQRBvDDdryWULI9qEjUfLdpwxGm6tfkTXZyjh2gmFYuMtXVz3bDzA7LjmKgt6m/0I6aQgOPJWYe7jKE/ZNWg2glo2GmdbsuKnhjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763817524; c=relaxed/simple;
	bh=ODXDVCBiOuYfi0vm2JeYtBpSzciUQQgAEQmzISvbYjg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kio2ipc7e2XML7J38H9YQS+8GtY4mz0xwOoNvaOudnneI1nNl6Reu+2i8fwPRc5i/X7TDvMYvzCzKWmBYsBoz24E9+dbHm4LRjhiinCM2tnOk7kN/WcH0XRxfCb6yhwtpVFTmyI6UgozMQHOCAH+Pjn3fa6W+EbTRus0zKhEwHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M0gpt2eM; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M0gpt2eM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763817523; x=1795353523;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ODXDVCBiOuYfi0vm2JeYtBpSzciUQQgAEQmzISvbYjg=;
  b=M0gpt2eM5YCFubzw6w9wlXpSuaUbl15f6d6ewgA07AvOd3nGmakbTs/7
   oWuObrtezPAEcM6hi1OGWtduMHaaO0P93WRFVysb2z+W2+SIb9w9qE9Fi
   EsFnxVAyCLN/NVjUBqBUJbYQcsGJX/5bltrMLJHVmieSPKqIf2JkfB91J
   nMkC6xaPBdZQIl5VTdK4GCsXv9ZGzaXRSif92RgTBXI1EE5AVMEJbIP45
   hA/cPz0nj73/VVuT88daQ4g3ZgOvob5jJVIDPWq7UnJaQKb79hYNIdccA
   BtAfsRnlk4v6j9VjM2GS5s6Qamn8C45qw/Ob3eSU9dZG1L8PXE9Xmf5cq
   Q==;
X-CSE-ConnectionGUID: 2b4FvcKjRN6sRK9pYEIStg==
X-CSE-MsgGUID: KKwA0aL9TmStClCD4k67Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="65828662"
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="65828662"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 05:18:43 -0800
X-CSE-ConnectionGUID: VKSh8HAAQE+xbpF8c0DoZg==
X-CSE-MsgGUID: BRkVVYVSQKWeLheDqvT6lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="191708697"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 22 Nov 2025 05:18:41 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMnVf-0007X1-0g;
	Sat, 22 Nov 2025 13:18:39 +0000
Date: Sat, 22 Nov 2025 21:18:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 10747/11041]
 tools/testing/selftests/../../../tools/testing/selftests/kselftest_harness.h:56:10:
 fatal error: asm/types.h: No such file or directory
Message-ID: <202511222145.tL2NICpQ-lkp@intel.com>
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
head:   d724c6f85e80a23ed46b7ebc6e38b527c09d64f5
commit: b5f70e33435e84a3e8302a5019612630a42dceab [10747/11041] selftests: complete kselftest include centralization
:::::: branch date: 31 hours ago
:::::: commit date: 2 days ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251122/202511222145.tL2NICpQ-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511222145.tL2NICpQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511222145.tL2NICpQ-lkp@intel.com/

Note: the linux-next/master HEAD d724c6f85e80a23ed46b7ebc6e38b527c09d64f5 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from proc-maps-race.c:26:
>> tools/testing/selftests/../../../tools/testing/selftests/kselftest_harness.h:56:10: fatal error: asm/types.h: No such file or directory
      56 | #include <asm/types.h>
         |          ^~~~~~~~~~~~~
   compilation terminated.
--
   In file included from get_syscall_info.c:10:
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
