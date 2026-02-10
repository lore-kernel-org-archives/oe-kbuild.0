Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A15C33DEDD
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Feb 2026 09:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770715755; cv=none; b=JXC6hPctb51z9DgimiF+HWFtYBaZbKP4jdg4KRXV5/cYeOsTwiEGZ1nNHLKu2hTwXtz9WMZbvUTdRfYkBisblAnuvOVmbFbZ2GuVzlRA1BiqoKbleE1An9hDrSfJZH8Fr7BSWRIa0cwrsNbidQurRW7Twv3OxMnIJ/A+uwS1POU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770715755; c=relaxed/simple;
	bh=TADrX0VvD/xGT7nrxtYiXte35RZVrRwmNIArVysxZrY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LtHpbPUeEs6yZxzjvJB5QvUdbAFdckUoJq76LptP7lnd9hW4JGkgqCb4RBNE1gCm3I+vYzJktlkNwNfyujVapotfKmCZ5juQsMMvlMVxozukqAxL9cqDbvRT4nQxCUvW7NAvThY8QvYiWofCSqoKCndxJV7KHW145oWX3YUd3Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VrmCJEj/; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VrmCJEj/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770715753; x=1802251753;
  h=date:from:to:cc:subject:message-id;
  bh=TADrX0VvD/xGT7nrxtYiXte35RZVrRwmNIArVysxZrY=;
  b=VrmCJEj/DVU/DL6DqrPDwUZT7zuH/aI/WI2cd8np2UmcS/7gR7Ra9+b0
   BRW+1z/oboDMvg5m8s8fKdrtDL5817Y9SQLZJnKyKsiJHxnWrOyFMECEZ
   APlyfF8mThnetg0W5VyjRVrcGModZbbFS0WlPHM+DkqXV25hIe5dgx8xh
   Q5DkaNKC1H6fXKdjJ0qKkRZKSnMiI5ZWxh5TFFTjxnog3vl+UlaS1me3P
   0e4NWOfEXXr236zcE+t4qzPwj2xEqZMoVDbMsNY9V6otVXqqntGEcw/dm
   4JTFRvATvIcdQFa4q/bJqDuZXgQba36RmTK3aeCG6oJju7D8p7GzHpXcf
   w==;
X-CSE-ConnectionGUID: bL0gTyMHTZm2zukiH2AD+A==
X-CSE-MsgGUID: /qeN1UNzQ261lfa4VUgOWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="82569193"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="82569193"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 01:29:13 -0800
X-CSE-ConnectionGUID: BErzSZYTQWinXbecr+qyLQ==
X-CSE-MsgGUID: NHL/ikYLQyCjTWhdV9DkPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="210955643"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 10 Feb 2026 01:29:12 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpk3R-000000000kr-3lyN;
	Tue, 10 Feb 2026 09:29:09 +0000
Date: Tue, 10 Feb 2026 10:28:34 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jarkko-tpmdd:container 4/15] signals.S:4:10: fatal error:
 asm/unistd.h: No such file or directory
Message-ID: <202602101009.kiSl3NYO-lkp@intel.com>
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
TO: Jarkko Sakkinen <jarkko@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git container
head:   f62d2a134716e021cfca8d7860048f9c71bd53c4
commit: fb9ff38678d37c68b7cb2a895999b4a26bbdc2e7 [4/15] containers: Introduce a container type
:::::: branch date: 5 hours ago
:::::: commit date: 6 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260210/202602101009.kiSl3NYO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602101009.kiSl3NYO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602101009.kiSl3NYO-lkp@intel.com/

All errors (new ones prefixed by >>):

   testcases/fake_sigreturn_bad_magic.c:10:10: fatal error: signal.h: No such file or directory
      10 | #include <signal.h>
         |          ^~~~~~~~~~
   compilation terminated.
   test_signals.c:11:10: fatal error: sys/auxv.h: No such file or directory
      11 | #include <sys/auxv.h>
         |          ^~~~~~~~~~~~
   compilation terminated.
   test_signals_utils.c:4:10: fatal error: stdio.h: No such file or directory
       4 | #include <stdio.h>
         |          ^~~~~~~~~
   compilation terminated.
   testcases/testcases.c:4:10: fatal error: ctype.h: No such file or directory
       4 | #include <ctype.h>
         |          ^~~~~~~~~
   compilation terminated.
>> signals.S:4:10: fatal error: asm/unistd.h: No such file or directory
       4 | #include <asm/unistd.h>
         |          ^~~~~~~~~~~~~~
   compilation terminated.
   In file included from sve_helpers.c:9:
   tools/testing/selftests/kselftest.h:53:10: fatal error: errno.h: No such file or directory
      53 | #include <errno.h>
         |          ^~~~~~~~~
   compilation terminated.
--
   testcases/fake_sigreturn_bad_size.c:10:10: fatal error: signal.h: No such file or directory
      10 | #include <signal.h>
         |          ^~~~~~~~~~
   compilation terminated.
   test_signals.c:11:10: fatal error: sys/auxv.h: No such file or directory
      11 | #include <sys/auxv.h>
         |          ^~~~~~~~~~~~
   compilation terminated.
   test_signals_utils.c:4:10: fatal error: stdio.h: No such file or directory
       4 | #include <stdio.h>
         |          ^~~~~~~~~
   compilation terminated.
   testcases/testcases.c:4:10: fatal error: ctype.h: No such file or directory
       4 | #include <ctype.h>
         |          ^~~~~~~~~
   compilation terminated.
>> signals.S:4:10: fatal error: asm/unistd.h: No such file or directory
       4 | #include <asm/unistd.h>
         |          ^~~~~~~~~~~~~~
   compilation terminated.
   In file included from sve_helpers.c:9:
   tools/testing/selftests/kselftest.h:53:10: fatal error: errno.h: No such file or directory
      53 | #include <errno.h>
         |          ^~~~~~~~~
   compilation terminated.
--
   testcases/fake_sigreturn_bad_size_for_magic0.c:10:10: fatal error: signal.h: No such file or directory
      10 | #include <signal.h>
         |          ^~~~~~~~~~
   compilation terminated.
   test_signals.c:11:10: fatal error: sys/auxv.h: No such file or directory
      11 | #include <sys/auxv.h>
         |          ^~~~~~~~~~~~
   compilation terminated.
   test_signals_utils.c:4:10: fatal error: stdio.h: No such file or directory
       4 | #include <stdio.h>
         |          ^~~~~~~~~
   compilation terminated.
   testcases/testcases.c:4:10: fatal error: ctype.h: No such file or directory
       4 | #include <ctype.h>
         |          ^~~~~~~~~
   compilation terminated.
>> signals.S:4:10: fatal error: asm/unistd.h: No such file or directory
       4 | #include <asm/unistd.h>
         |          ^~~~~~~~~~~~~~
   compilation terminated.
   In file included from sve_helpers.c:9:
   tools/testing/selftests/kselftest.h:53:10: fatal error: errno.h: No such file or directory
      53 | #include <errno.h>
         |          ^~~~~~~~~
   compilation terminated.
--
   testcases/fake_sigreturn_duplicated_fpsimd.c:10:10: fatal error: signal.h: No such file or directory
      10 | #include <signal.h>
         |          ^~~~~~~~~~
   compilation terminated.
   test_signals.c:11:10: fatal error: sys/auxv.h: No such file or directory
      11 | #include <sys/auxv.h>
         |          ^~~~~~~~~~~~
   compilation terminated.
   test_signals_utils.c:4:10: fatal error: stdio.h: No such file or directory
       4 | #include <stdio.h>
         |          ^~~~~~~~~
   compilation terminated.
   testcases/testcases.c:4:10: fatal error: ctype.h: No such file or directory
       4 | #include <ctype.h>
         |          ^~~~~~~~~
   compilation terminated.
>> signals.S:4:10: fatal error: asm/unistd.h: No such file or directory
       4 | #include <asm/unistd.h>
         |          ^~~~~~~~~~~~~~
   compilation terminated.
   In file included from sve_helpers.c:9:
   tools/testing/selftests/kselftest.h:53:10: fatal error: errno.h: No such file or directory
      53 | #include <errno.h>
         |          ^~~~~~~~~
   compilation terminated.
--
   testcases/fake_sigreturn_misaligned_sp.c:10:10: fatal error: signal.h: No such file or directory
      10 | #include <signal.h>
         |          ^~~~~~~~~~
   compilation terminated.
   test_signals.c:11:10: fatal error: sys/auxv.h: No such file or directory
      11 | #include <sys/auxv.h>
         |          ^~~~~~~~~~~~
   compilation terminated.
   test_signals_utils.c:4:10: fatal error: stdio.h: No such file or directory
       4 | #include <stdio.h>
         |          ^~~~~~~~~
   compilation terminated.
   testcases/testcases.c:4:10: fatal error: ctype.h: No such file or directory
       4 | #include <ctype.h>
         |          ^~~~~~~~~
   compilation terminated.
>> signals.S:4:10: fatal error: asm/unistd.h: No such file or directory
       4 | #include <asm/unistd.h>
         |          ^~~~~~~~~~~~~~
   compilation terminated.
   In file included from sve_helpers.c:9:
   tools/testing/selftests/kselftest.h:53:10: fatal error: errno.h: No such file or directory
      53 | #include <errno.h>
         |          ^~~~~~~~~
   compilation terminated.
--
   testcases/fake_sigreturn_missing_fpsimd.c:10:10: fatal error: stdio.h: No such file or directory
      10 | #include <stdio.h>
         |          ^~~~~~~~~
   compilation terminated.
   test_signals.c:11:10: fatal error: sys/auxv.h: No such file or directory
      11 | #include <sys/auxv.h>
         |          ^~~~~~~~~~~~
   compilation terminated.
   test_signals_utils.c:4:10: fatal error: stdio.h: No such file or directory
       4 | #include <stdio.h>
         |          ^~~~~~~~~
   compilation terminated.
   testcases/testcases.c:4:10: fatal error: ctype.h: No such file or directory
       4 | #include <ctype.h>
         |          ^~~~~~~~~
   compilation terminated.
>> signals.S:4:10: fatal error: asm/unistd.h: No such file or directory
       4 | #include <asm/unistd.h>
         |          ^~~~~~~~~~~~~~
   compilation terminated.
   In file included from sve_helpers.c:9:
   tools/testing/selftests/kselftest.h:53:10: fatal error: errno.h: No such file or directory
      53 | #include <errno.h>
         |          ^~~~~~~~~
   compilation terminated.
--
   In file included from testcases/fake_sigreturn_sme_change_vl.c:9:
   tools/testing/selftests/kselftest.h:53:10: fatal error: errno.h: No such file or directory
      53 | #include <errno.h>
         |          ^~~~~~~~~
   compilation terminated.
   test_signals.c:11:10: fatal error: sys/auxv.h: No such file or directory
      11 | #include <sys/auxv.h>
         |          ^~~~~~~~~~~~
   compilation terminated.
   test_signals_utils.c:4:10: fatal error: stdio.h: No such file or directory
       4 | #include <stdio.h>
         |          ^~~~~~~~~
   compilation terminated.
   testcases/testcases.c:4:10: fatal error: ctype.h: No such file or directory
       4 | #include <ctype.h>
         |          ^~~~~~~~~
   compilation terminated.
>> signals.S:4:10: fatal error: asm/unistd.h: No such file or directory
       4 | #include <asm/unistd.h>
         |          ^~~~~~~~~~~~~~
   compilation terminated.
   In file included from sve_helpers.c:9:
   tools/testing/selftests/kselftest.h:53:10: fatal error: errno.h: No such file or directory
      53 | #include <errno.h>
         |          ^~~~~~~~~
   compilation terminated.
--
   testcases/fpmr_siginfo.c:9:10: fatal error: signal.h: No such file or directory
       9 | #include <signal.h>
         |          ^~~~~~~~~~
   compilation terminated.
   test_signals.c:11:10: fatal error: sys/auxv.h: No such file or directory
      11 | #include <sys/auxv.h>
         |          ^~~~~~~~~~~~
   compilation terminated.
   test_signals_utils.c:4:10: fatal error: stdio.h: No such file or directory
       4 | #include <stdio.h>
         |          ^~~~~~~~~
   compilation terminated.
   testcases/testcases.c:4:10: fatal error: ctype.h: No such file or directory
       4 | #include <ctype.h>
         |          ^~~~~~~~~
   compilation terminated.
>> signals.S:4:10: fatal error: asm/unistd.h: No such file or directory
       4 | #include <asm/unistd.h>
         |          ^~~~~~~~~~~~~~
   compilation terminated.
   In file included from sve_helpers.c:9:
   tools/testing/selftests/kselftest.h:53:10: fatal error: errno.h: No such file or directory
      53 | #include <errno.h>
         |          ^~~~~~~~~
   compilation terminated.
--
   testcases/gcs_exception_fault.c:6:10: fatal error: errno.h: No such file or directory
       6 | #include <errno.h>
         |          ^~~~~~~~~
   compilation terminated.
   test_signals.c:11:10: fatal error: sys/auxv.h: No such file or directory
      11 | #include <sys/auxv.h>
         |          ^~~~~~~~~~~~
   compilation terminated.
   test_signals_utils.c:4:10: fatal error: stdio.h: No such file or directory
       4 | #include <stdio.h>
         |          ^~~~~~~~~
   compilation terminated.
   testcases/testcases.c:4:10: fatal error: ctype.h: No such file or directory
       4 | #include <ctype.h>
         |          ^~~~~~~~~
   compilation terminated.
>> signals.S:4:10: fatal error: asm/unistd.h: No such file or directory
       4 | #include <asm/unistd.h>
         |          ^~~~~~~~~~~~~~
   compilation terminated.
   In file included from sve_helpers.c:9:
   tools/testing/selftests/kselftest.h:53:10: fatal error: errno.h: No such file or directory
      53 | #include <errno.h>
         |          ^~~~~~~~~
   compilation terminated.
--
   testcases/gcs_frame.c:6:10: fatal error: signal.h: No such file or directory
       6 | #include <signal.h>
         |          ^~~~~~~~~~
   compilation terminated.
   test_signals.c:11:10: fatal error: sys/auxv.h: No such file or directory
      11 | #include <sys/auxv.h>
         |          ^~~~~~~~~~~~
   compilation terminated.
   test_signals_utils.c:4:10: fatal error: stdio.h: No such file or directory
       4 | #include <stdio.h>
         |          ^~~~~~~~~
   compilation terminated.
   testcases/testcases.c:4:10: fatal error: ctype.h: No such file or directory
       4 | #include <ctype.h>
         |          ^~~~~~~~~
   compilation terminated.
>> signals.S:4:10: fatal error: asm/unistd.h: No such file or directory
       4 | #include <asm/unistd.h>
         |          ^~~~~~~~~~~~~~
   compilation terminated.
   In file included from sve_helpers.c:9:
   tools/testing/selftests/kselftest.h:53:10: fatal error: errno.h: No such file or directory
      53 | #include <errno.h>
         |          ^~~~~~~~~
   compilation terminated.
--
   testcases/gcs_write_fault.c:6:10: fatal error: errno.h: No such file or directory
       6 | #include <errno.h>
         |          ^~~~~~~~~
   compilation terminated.
   test_signals.c:11:10: fatal error: sys/auxv.h: No such file or directory
      11 | #include <sys/auxv.h>
         |          ^~~~~~~~~~~~
   compilation terminated.
   test_signals_utils.c:4:10: fatal error: stdio.h: No such file or directory
       4 | #include <stdio.h>
         |          ^~~~~~~~~
   compilation terminated.
   testcases/testcases.c:4:10: fatal error: ctype.h: No such file or directory
       4 | #include <ctype.h>
         |          ^~~~~~~~~
   compilation terminated.
>> signals.S:4:10: fatal error: asm/unistd.h: No such file or directory
       4 | #include <asm/unistd.h>
         |          ^~~~~~~~~~~~~~
   compilation terminated.
   In file included from sve_helpers.c:9:
   tools/testing/selftests/kselftest.h:53:10: fatal error: errno.h: No such file or directory
      53 | #include <errno.h>
         |          ^~~~~~~~~
   compilation terminated.
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
